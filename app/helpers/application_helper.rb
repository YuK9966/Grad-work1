module ApplicationHelper
  def flash_class(level)
      puts "LEVEL = #{level.inspect}"
    case level.to_s
      when "notice"
        "bg-blue-100 border border-blue-300 text-blue-800 px-4 py-2"
      when "success"
        "bg-green-100 border border-green-300 text-green-800 px-4 py-2"
      when "error"
        "bg-red-100 border border-red-300 text-red-800 px-4 py-2"
      when "alert"
        "bg-yellow-100 border border-yellow-300 text-yellow-800 px-4 py-2"
    end
  end
end