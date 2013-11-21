module StudyRequestHelper

  def unions_divided_by_categories
    options = {}
    Category.scoped.includes(:unions).each do |category|
      options[category.name] = category.unions
    end

    options
  end
end