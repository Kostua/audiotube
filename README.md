# Audiotube

## Overview

Audiotube is a Python-based application that leverages a microservices architecture to convert YouTube videos into downloadable MP3 files. The application processes a given YouTube video URL, extracts the audio track, and provides a download URL for the resulting MP3 file. Future iterations of Audiotube will also offer an RSS feed feature.

The services in Audiotube are orchestrated and managed via Kubernetes, with the entire application hosted on Amazon Web Services (AWS).

## Features

- YouTube Video URL Processing
- Audio Track Extraction from YouTube Videos
- Generation of MP3 files from the extracted audio
- Downloadable MP3 files via generated URL
- Planned future RSS feed feature

## Technologies Used

- Python
- Microservices
- Kubernetes
- AWS
- Docker
