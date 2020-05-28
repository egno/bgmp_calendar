import asyncio
import asyncpg
from aiohttp import web
import os
import json
import datetime

from dotenv import load_dotenv

load_dotenv()

print(os.environ)
print(f'asyncpg: {asyncpg.__version__}')
print(f'json: {json.__version__}')

queries = {
    'dates': '''
select dt, ts, jsonb_path_query_array(resp, '$[*].Text') times 
from dates
where resp is not null 
and resp @? '$[*].Text'
order by dt
        '''
}


def _converter(o):
    if isinstance(o, datetime.datetime):
        return o.__str__()
    if isinstance(o, datetime.date):
        return o.__str__()


def _dumps(d):
    return json.dumps(d, default=_converter)


async def query(connection, query):
    await connection.set_type_codec(
        'jsonb',
        encoder=_dumps,
        decoder=json.loads,
        schema='pg_catalog'
    )
    # Open a transaction.
    async with connection.transaction():
        # Run the query passing the request argument.
        result = await connection.fetch(query)
        return [dict(r) for r in result]


async def handle(request):
    sql = queries.get(request.match_info['route'])
    if not sql:
        return web.Response(status=404)

    """Handle incoming requests."""
    pool = request.app['pool']

    # Take a connection from the pool.
    async with pool.acquire() as connection:
        result = await query(connection, sql)
        return web.json_response(result, dumps=_dumps)


async def init_app():
    """Initialize the application server."""
    app = web.Application()
    # Create a database connection pool
    app['pool'] = await asyncpg.create_pool()
    # Configure service routes
    app.router.add_route('GET', '/{route}', handle)
    return app


loop = asyncio.get_event_loop()
app = loop.run_until_complete(init_app())

if __name__ == '__main__':
    web.run_app(app)
