module CategoriesHelper
    # might require refactoring
    def category_image category
        unless category.image_attachment
            image_tag 'no-img.jpg', class: 'img-fluid'
        else
            image_tag category.image, class: 'img-fluid'
        end
    end
end