from config import content_docker_compose_file
import subprocess


class BotCreator:
    def __init__(self, token: str):
        self.token = token

    def bot_up(self):
        try:
            with open("./bot/docker-compose.yml", "w") as f:
                f.write(content_docker_compose_file(self.token))
            subprocess.run(["docker-compose", "-f", "./bot/docker-compose.yml", "up", "--build"], check=True)
        except subprocess.CalledProcessError as e:
            print(f"Error while docker-compose up command: {e}")
