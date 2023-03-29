class Note
  attr_accessor :title, :content

  def initialize(title, content)
    @title = title
    @content = content
  end
end

class NotesApplication
  def initialize
    @notes = []
  end

  def create(title, content)
    note = Note.new(title, content)
    @notes << note
    puts "Note created successfully!"
  end

  def list
    if @notes.empty?
      puts "No notes found."
    else
      puts "Your notes:"
      @notes.each_with_index do |note, index|
        puts "#{index + 1}. #{note.title}"
        puts note.content
        puts "-" * 20
      end
    end
  end

  def edit(index, title, content)
    if @notes[index - 1].nil?
      puts "Note not found."
    else
      @notes[index - 1].title = title
      @notes[index - 1].content = content
      puts "Note updated successfully!"
    end
  end

  def delete(index)
    if @notes[index - 1].nil?
      puts "Note not found."
    else
      @notes.delete_at(index - 1)
      puts "Note deleted successfully!"
    end
  end
end

notes_app = NotesApplication.new

loop do
  puts "What would you like to do?"
  puts "1. Create a new note"
  puts "2. List all notes"
  puts "3. Edit a note"
  puts "4. Delete a note"
  puts "5. Exit"

  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Enter the title of the note:"
    title = gets.chomp
    puts "Enter the content of the note:"
    content = gets.chomp
    notes_app.create(title, content)
  when 2
    notes_app.list
  when 3
    puts "Enter the index of the note you want to edit:"
    index = gets.chomp.to_i
    puts "Enter the new title of the note:"
    title = gets.chomp
    puts "Enter the new content of the note:"
    content = gets.chomp
    notes_app.edit(index, title, content)
  when 4
    puts "Enter the index of the note you want to delete:"
    index = gets.chomp.to_i
    notes_app.delete(index)
  when 5
    break
  else
    puts "Invalid choice. Please try again."
  end
end
