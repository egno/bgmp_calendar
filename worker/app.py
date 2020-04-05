from multiprocessing import Pool, current_process
from requests import post
from itertools import repeat
import datetime
import time
import db
import os
import json
import logging

from dotenv import load_dotenv

load_dotenv()

URL = os.getenv('URL')
PROXY = os.getenv('PROXY')
TIMEOUT_SEC = 15
DEEP_DAYS = 365

def get_time(date):
    data = {
        'id': date.strftime('%d.%m.%Y')
    }
    try:
        response = post(f'{URL}/Home/GetTimeByDate',
                        json=data,
                        timeout=TIMEOUT_SEC)
        json_response = response.json()
        db.save(date, json.dumps(json_response))
        return date
    except Exception as e:
        logging.error(current_process(), date.strftime('%d.%m.%Y'), e)
    return


def generate_dates(start_date, count):
    td = datetime.timedelta(hours=24)
    current_date = start_date
    cnt = 0
    while cnt < count:
        cnt += 1
        yield current_date
        current_date += td


def check_dates():
    start_date = datetime.datetime.now().date()
    start_date += datetime.timedelta(hours=24)

    pool = Pool(20)
    results = pool.map(get_time, generate_dates(start_date, DEEP_DAYS))
    pool.close()
    pool.join()

    res = [dt for dt in results if dt]
    return sorted(set(res))


def loop_check():
    while True:
        check_dates()
        time.sleep(15*60)


if __name__ == "__main__":
    logging.info('started')
    loop_check()