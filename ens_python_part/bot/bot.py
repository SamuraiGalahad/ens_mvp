from aiogram import Bot, Dispatcher, types
from aiogram.filters import CommandStart
from aiogram.enums import ParseMode
from aiogram.types import Message
from os import getenv
import traceback
import pymongo
import asyncio
import logging
import sys


dp = Dispatcher()


@dp.message(CommandStart())
async def command_start_handler(message: Message) -> None:
    await message.answer(f"Your chat id added to local bot memory!")
    try:
        chat_id = message.chat.id

        with open("ids", "a") as file:
            file.write(str(chat_id) + "\n")


    except Exception as er:
        print(er)
        print(traceback.format_exc())


@dp.message()
async def echo_handler(message: types.Message) -> None:
    await message.answer(f"Your chat id added to local bot memory!")
    try:
        chat_id = message.chat.id

        with open("ids", "a") as file:
            file.write(str(chat_id) + "\n")

    except Exception as er:
        print(er)
        print(traceback.format_exc())


async def main() -> None:
    bot = Bot("hereToken", parse_mode=ParseMode.HTML)
    await dp.start_polling(bot)


if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO, stream=sys.stdout)
    asyncio.run(main())
