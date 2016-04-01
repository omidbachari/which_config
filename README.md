# WhichConfig

### Overview

This application is an Elixir on Phoenix API that surveys Mojos for data on their development environment. A script can be included in the configuration layer of a text editor, for example, that sends a payload with valuable data to this API. In turn, WhichConfig will broadcast live data on that activity. 

### Example Post

`curl --data "config[config_handle]=spacemacs&config[owner]=omidz" http://localhost:4000/api/configs`
