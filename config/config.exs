import Config

config :n2o,
  app: :chat_app,
  port: 8001,
  pickler: :n2o_secret,
  mq: :n2o_syn,
  upload: "./priv/static",
  nitro_prolongate: true,
  ttl: 60,
  protocols: [:nitro_n2o, :n2o_ftp],
  routes: ChatApp.Routes
