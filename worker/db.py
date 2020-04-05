import asyncio
import asyncpg

from dotenv import load_dotenv

load_dotenv()

async def do_saving_data(date, resp):
    conn = await asyncpg.connect()
    await conn.execute('''
        CALL add_resp($1, $2)
    ''', date, resp)
    await conn.close()

def save(date, resp):
    asyncio.get_event_loop().run_until_complete(do_saving_data(date, resp))