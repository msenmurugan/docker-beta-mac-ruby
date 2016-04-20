# docker-beta-mac-ruby
Repo for Docker Beta Mac Issue to post to Docker Beta Forums.

Note: This repository is incomplete and is only for reproducing DNS issues, it does not contain a full rails app.

## Build Rails Container Image
  1. git clone git@github.com:ecliptik/docker-beta-mac-ruby.git
  2. docker build --no-cache -t docker-beta-mac-ruby .

### Errors
```
Fetching gem metadata from https://rubygems.org/............
Fetching version metadata from https://rubygems.org/...
Fetching dependency metadata from https://rubygems.org/..
Resolving dependencies.....
Installing rake 11.1.2
Installing i18n 0.7.0
Installing json 1.8.3 with native extensions
Installing minitest 5.8.4
Installing thread_safe 0.3.5
Installing builder 3.2.2

Gem::RemoteFetcher::UnknownHostError: no such name (https://rubygems.org/gems/erubis-2.7.0.gem)
Installing mini_portile2 2.0.0
Installing rack 1.6.4
Installing mime-types-data 3.2016.0221
Installing arel 6.0.3
Installing addressable 2.4.0

Gem::RemoteFetcher::UnknownHostError: no such name (https://rubygems.org/gems/htmlentities-4.3.4.gem)
Installing rubyzip 1.0.0
Using bundler 1.11.2
Installing thor 0.19.1
Installing concurrent-ruby 1.0.1
Installing coderay 1.1.1
Installing bigdecimal 1.2.7 with native extensions
Installing debug_inspector 0.0.2 with native extensions
Installing hashie 3.4.3
Installing httpclient 2.7.1
Installing jwt 1.5.4
Installing oj 2.15.0 with native extensions

Gem::RemoteFetcher::UnknownHostError: no such name (https://rubygems.org/gems/byebug-8.2.4.gem)
Installing ffi 1.9.10 with native extensions
Installing coffee-script-source 1.10.0
...
```

## Build Shell Container image
  1. git clone git@github.com:ecliptik/docker-beta-mac-ruby.git
  2. docker build -f Dockerfile.shell --no-cache -t docker-beta-mac-ruby .
  3. docker run -it --rm docker-beta-mac-ruby
  4. while true; do dig rubygems.org +short; sleep 1; done

## Errors

```
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15

; <<>> DiG 9.9.5-9+deb8u6-Debian <<>> rubygems.org +short
;; global options: +cmd
;; connection timed out; no servers could be reached
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15

; <<>> DiG 9.9.5-9+deb8u6-Debian <<>> rubygems.org +short
;; global options: +cmd
;; connection timed out; no servers could be reached
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15
54.186.104.15
...
```

