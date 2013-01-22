module StudyRequestHelper

  def unions_divided_by_categories
    options = []
    Category.scoped.includes(:unions).each do |category|
      options << [category.name, category.unions.map {|u| [u, u.id]}]
    end

    options
  end
end