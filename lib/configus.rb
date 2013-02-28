Configus.build Rails.env do
  env :production do
    admin do
      auth do
        username "admin@castle.ru"
        password "123456"
      end
    end
  end

  env :development, parent: :production do
  end

  env :staging, parent: :production do
  end

  env :test, parent: :development do
  end
end
