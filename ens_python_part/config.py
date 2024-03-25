def content_docker_compose_file(token: str):
    compose_file = f"""
    version: '3.8'
    
    services:
      mongodb:
        image: mongo:latest
        container_name: mongodb
        ports:
          - "27017:27017"
        volumes:
          - mongodb_data:/data/db
    
      python_app:
        build:
          context: ..
          dockerfile: Dockerfile
        container_name: python_app
        depends_on:
          - mongodb
        volumes:
          - ./app:/app
        environment:
          MONGO_URI: mongodb://mongodb:27017/
          TOKEN: {token}
    
    volumes:
      mongodb_data:
    """

    return compose_file
