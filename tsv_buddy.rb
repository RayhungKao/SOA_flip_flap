# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split("\n").map { |line| line.split("\t") }
    headers = rows.first
    data_rows = rows[1..-1]
    @data = data_rows.map do |row|
      row.map.with_index { |cell, i| [headers[i], cell] }.to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    full_text = "date\tstudent_id\tlanguages\tbest_language\tapp_experience\ttech_experience\n"
    @data.each do |set|
      set.each do |_k, v|
        full_text += v.to_s
        full_text += "\t"
      end
      full_text.chomp!("\t")
      full_text += "\n"
    end
    @data = full_text
  end
end
