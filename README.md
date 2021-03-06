# WhichConfig
[![Build Status](https://semaphoreci.com/api/v1/omid/which_config/branches/master/badge.svg)](https://semaphoreci.com/omid/which_config)
### Overview

This application is an Elixir on Phoenix API that surveys Mojos for data on their development environment. A script can be included in the configuration layer of a text editor, for example, that sends a payload with valuable data to this API. In turn, WhichConfig will broadcast live data on that activity. 

### Setup

Follow the elixir install instructions [here](http://elixir-lang.org/install.html).

Follow the phoenix install instructions [here](http://www.phoenixframework.org/docs/installation#section-phoenix). The steps here include getting `node` and `psql` installed.

#### Setup commands  
```no-highlight
$ git clone:git@github.com:omidbachari/which_config.git
$ mix deps.get
$ npm install
$ mix ecto.create && mix ecto.migrate
```

#### Test
```no-highlight
$ mix test
```

#### Run server locally
```no-highlight
$ mix phoenix.server
```

#### Example command line interaction with API
```no-highlight
$ curl --data "config[config_handle]=spacemacs&config[owner]=your_name" http://localhost:4000/api/configs
```
