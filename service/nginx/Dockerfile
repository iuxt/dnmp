FROM ubuntu:latest
RUN apt update ; \
    apt install -y nginx ; \
    apt clean all 

CMD ["nginx", "-g", "daemon off;"]
