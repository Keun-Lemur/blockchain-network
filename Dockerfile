# Support setting various labels on the final image
ARG COMMIT=""
ARG VERSION=""
ARG BUILDNUM=""

# Build Pract in a stock Go builder container
FROM golang:1.18-alpine as builder

RUN apk add --no-cache gcc musl-dev linux-headers git

# Get dependencies - will also be cached if we won't change go.mod/go.sum
COPY go.mod /go-practeum/
COPY go.sum /go-practeum/
RUN cd /go-practeum && go mod download

ADD . /go-practeum
RUN cd /go-practeum && go run build/ci.go install -static ./cmd/pract

# Pull Pract into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-practeum/build/bin/pract /usr/local/bin/

EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["pract"]

# Add some metadata labels to help programatic image consumption
ARG COMMIT=""
ARG VERSION=""
ARG BUILDNUM=""

LABEL commit="$COMMIT" version="$VERSION" buildnum="$BUILDNUM"
