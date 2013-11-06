Configus.build Rails.env do
  env :production do
    per_page_count do
      searches 20
      photo_albums 5
      instructors 24
    end

    social_links do
      vk 'https://vk.com/club19709157'
    end

    limits do
      news 3
    end
  end

  env :development, parent: :production do
  end

  env :staging, parent: :production do
  end

  env :test, parent: :development do
  end
end
