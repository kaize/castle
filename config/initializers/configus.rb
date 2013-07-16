Configus.build Rails.env do
  env :production do
    admin do
      auth do
        username "admin@castle.ru"
        password "123456"
      end
    end

    per_page_count do
      searches 20
      photo_albums 5
      instructors 24
    end

    limits do
      news 3
    end

    fog_credentials do
      provider 'AWS'
      bucket 'dvorec73'
    end
  end

  env :development, parent: :production do
  end

  env :staging, parent: :production do
  end

  env :test, parent: :development do
  end
end
