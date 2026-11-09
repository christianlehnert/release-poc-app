FROM busybox:1.37
COPY src/ /app/
USER 65534
ENTRYPOINT ["sh", "-c", "echo app $(cat /app/VERSION)"]
