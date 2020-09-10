# Flutter_GnamGnamManga

[![Build Status](https://travis-ci.org/devilmac/flutter_gnamgnammanga.svg?branch=develop)](https://travis-ci.org/devilmac/flutter_gnamgnammanga)

This repository contains the source code of the Flutter_GnamGnamManga mobile application. To create it, it was used the new mobile framework Flutter.

## Architecture of the app

The architecture used to make the app is the clean architecture (at least I'm trying to follow it). The code is structured by features and grouped by layer, as shown below:

- ui (contains the code related to the UI of the app)
- repository (contains the code used to make request to the DB or over the network)
- domain (contains the main classes used by both repository and ui)
- locale (contains the code used to internationalizing the app)
- state (code used to manage the state of the app

## Features of the app

Flutter_GnamGnamManga allows you to do the following:

- you can search your manga from a variety of online services (only [Mangaeden](https://www.mangaeden.com/it/) supported right now)
- you can choose the language of manga, if supported by service
- you can save your favorite manga in a separate section without search it over and over from all the others
- you can navigate from several categories (TODO)
