class GeneralPage < SitePrism::Page

  private

  def all_visible?(*item_list)
    item_list.all? { |item| send(item).visible? }
  end
end