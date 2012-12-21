module FlashHelper
  def flash_success
    flash[:success] = flash_translate :success
  end

  def flash_error
    flash.now[:error] = flash_translate :error
  end

  def flash_notice
    flash[:notice] = flash_translate :notice
  end

  private

    def flash_translate(key)
      scope = [:flash, :controllers]
      scope += params[:controller].split('/')
      scope << params[:action]

      t(key, :scope => scope)
    end

end
