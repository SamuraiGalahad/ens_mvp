import logging

from fastapi import FastAPI
import requests as rq
from pydantic import BaseModel


app = FastAPI()

@app.get("/")
def s():
    return {"message": "Hello!"}

class User(BaseModel):
    user: str

@app.post("/token/")
def read_item(user: User):
    with open("ids", "r") as file:
        lines = file.readlines()
    info = ""

    for id in lines:
        info = rq.post(f"https://api.telegram.org/bot<hereToken>/sendMessage", data={"chat_id": id.strip(), "text":"Lol. You here?"})
    return {"item_id": user.user}
