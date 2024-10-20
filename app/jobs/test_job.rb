class TestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "✅✅✅✅ #{SecureRandom.hex(10)}"
  end
end
