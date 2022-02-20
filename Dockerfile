FROM golang as build

WORKDIR /app

COPY . .

RUN go env -w GO111MODULE=off

RUN go build -o /appgo

#CMD [ "/appgo" ]

FROM scratch

WORKDIR /app

COPY --from=build ./appgo ./appgo

CMD [ "/app/appgo" ]