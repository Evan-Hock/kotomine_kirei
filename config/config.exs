import Config

config :nostrum,
  token: System.get_env("KOTOMINE_KIREI_BOT_TOKEN"),
  ffmpeg: false,
  gateway_intents: [
    :guild_messages
  ]
