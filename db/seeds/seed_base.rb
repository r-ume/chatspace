class SeedBase
  attr_accessor :model_name, :columns

  # Constant
  DUMMY_REPEAT_NUM = 20

  def initialize(model_name:, **columns)
    @model_name = model_name
    @columns    = columns
    @record     = nil
  end

  def save!
    @record = self.model.new(@columns)
    @record.save!
  end

  def output_columns
    p '------------'
    self.model.column_names.each do |column|
      p "#{column}: #{@record.send(column)}"
    end
    p '------------'
  end
  
  def record_sum
    self.model.count
  end

  def model
    @model_name.constantize
  end

  def output_error(error:)
    p "Seed file fails because #{error.message}. Total: #{self.record_sum}" 
  end

end 
