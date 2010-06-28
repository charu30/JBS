require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "Invalid with empty attributes" do
    note = Note.new
    assert !note.valid?
    assert note.errors.invalid?(:title)
    assert note.errors.invalid?(:description)
  end
end
