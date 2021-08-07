name: Docker

on:
  push:
    branches:
      - master

  # Run tests for any PRs.
  pull_request:

env:
  IMAGE_NAME: ros_vnc

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
      - name: Run tests
        run: ./BUILD-DOCKER-IMAGE.sh $IMAGE_NAME

  # Push image to GitHub Packages.
  push:
    needs: test

    runs-on: ubuntu-latest
    if: github.event_name == 'push'

    steps:
      - uses: actions/checkout@v2
      - name: Build image
        run: ./BUILD-DOCKER-IMAGE.sh $IMAGE_NAME

      - name: Log into GitHub Container Registry
        run: echo "${{secrets.CR_PAT}}" | docker login https://ghcr.io -u ${{github.actor}} --password-stdin

      - name: Push image to GitHub Container Registry
        run: |
          IMAGE_ID=ghcr.io/${{github.repository_owner}}/$IMAGE_NAME
          # Change all uppercase to lowercase
          IMAGE_ID=$(echo $IMAGE_ID | tr '[A-Z]' '[a-z]')
          # Set VERSION
          VERSION=latest
          echo IMAGE_ID=$IMAGE_ID
          echo VERSION=$VERSION
          docker tag $IMAGE_NAME:$VERSION $IMAGE_ID:$VERSION
          docker push $IMAGE_ID:$VERSION