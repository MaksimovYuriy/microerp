source "https://rubygems.org"

ruby "3.3.0"

gem "rails", "~> 7.1.3"

# База данных PostgreSQL
gem "pg", ">= 1.1", "< 2.0"

# Веб-сервер
gem "puma", ">= 5.0"

# Graphiti — сериализация и построение API по JSON:API
gem "graphiti"
gem "graphiti-rails"

# AASM - конечный автомат для моделей
gem 'aasm'

# CORS для разрешения кросс-доменных запросов
gem "rack-cors"

# JWT аутентификация поверх devise
gem "devise"
gem "devise-jwt"

# Авторизация
gem "pundit"

# Быстрая работа с JSON
gem "oj"

# Пагинация (если понадобится)
gem "kaminari"

# Фоновые задачи (если будут)
gem "sidekiq"

# Кэширование
gem "redis"

# Загрузка файлов (если нужно)
# gem "image_processing", "~> 1.2"

# Сокращает время загрузки приложений (кэш)
gem "bootsnap", require: false

# Для поддержки таймзон в Windows и JRuby (если потребуется)
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  # Тестирование
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "shoulda-matchers"

  # Чистка базы для тестов
  gem "database_cleaner-active_record"

  # Инструменты отладки
  gem "debug", platforms: %i[mri windows]

  #
  gem 'rswag-api'
  gem 'rswag-ui'
  gem 'rswag-specs'
end

group :development do
  # Автоматическая перезагрузка и ускорение команд (можно раскомментировать при необходимости)
  # gem "spring"
end


