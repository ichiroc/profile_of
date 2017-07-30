class AnalyzeEntitiesJob < ApplicationJob
  queue_as :default

  def perform(source)
    source.fetch_texts!
  end
end
