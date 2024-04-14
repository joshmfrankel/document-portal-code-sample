class FlashComponent < ApplicationComponent
  def initialize(flash:)
    @flash = flash
  end

  def classes
    class_names(
      "py-2 px-3 mb-5 font-medium rounded-lg inline-block w-fit",
      "bg-green-50 text-green-500" => @flash[:notice].present?,
      "bg-red-50 text-red-500" => @flash[:alert].present?
    )
  end

  def id
    return :notice if @flash[:notice].present?

    :alert
  end

  def body
    return @flash[:notice] if @flash[:notice].present?

    @flash[:alert]
  end

  def render?
    @flash[:notice].present? || @flash[:alert].present?
  end
end
