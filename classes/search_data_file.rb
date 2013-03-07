class SearchDataFile
  attr_reader :input_path, :output_path, :original_filename, :word_list, :access_code

  def initialize(file_params)
    @access_code = generate_access_code
    @input_path = file_params[:tempfile]
    @output_path = generate_output_path
    @original_filename = file_params[:filename]
  end

  def write
    FileUtils.touch output_path
    CSV.open(output_path, "wb") do |csv|
      word_list.each do |word, hits|
        csv << [word, hits]
      end
    end
  end

  def process
    @word_list = read_csv
    self
  end

  def name
    "processed_#{original_filename}"
  end

  private

  def row_to_phrase(row)
    Phrase.new(row[0], row[1]).tally
  end
  
  def read_csv
    search_phrase_list = []
    CSV.foreach(input_path) do |row|
      row_to_phrase(row)
    end

    Word.depluralized_list
  end

  def generate_access_code
    SecureRandom.urlsafe_base64(20)
  end

  def generate_output_filename
    "#{access_code}.csv"
  end

  def generate_output_path
    "#{settings.root}/processed_files/#{generate_output_filename}"
  end
end