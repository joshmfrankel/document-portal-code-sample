module ApplicationHelper
  # Simple helper to show active styles for current page
  def navbar_link_classes(link)
    class_names(
      "text-white hover:text-seafoam-400",
      "no-underline" => link.nil? || url_for.exclude?(link),
      "underline" => link.present? && url_for.include?(link)
    )
  end
end
