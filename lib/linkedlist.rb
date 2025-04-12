# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(value)
    new_tail = Node.new(value)

    if @head.nil?
      @head = new_tail
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?

      current_node.next_node = new_tail
    end
  end

  def prepend(value)
    new_head = Node.new(value)

    new_head.next_node = @head
    @head = new_head
  end

  def size
    current_node = @head
    nodes = 0

    until current_node.nil?
      nodes += 1
      current_node = current_node.next_node
    end

    nodes
  end

  def tail
    return nil if @head.nil?

    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?

    current_node
  end

  def at(index)
    return nil if @head.nil?
    return nil if index.negative?

    current_node = @head
    current_index = 0

    until current_index >= index
      return nil if current_node.next_node.nil?

      current_node = current_node.next_node
      current_index += 1
    end

    current_node
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      popped_node = @head
      @head = nil

      return popped_node
    end

    current_node = @head
    current_node = current_node.next_node until current_node.next_node.next_node.nil?

    popped_node = current_node.next_node
    current_node.next_node = nil

    popped_node
  end

  def contains?(value)
    return false if @head.nil?

    current_node = @head

    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    return nil if @head.nil?

    current_node = @head
    index = 0

    until current_node.nil?
      return index if current_node.value == value

      current_node = current_node.next_node
      index += 1
    end

    nil
  end

  def to_s
    string_nodes = ''
    current_node = @head

    until current_node.nil?
      string_nodes << "(#{current_node.value}) -> "
      current_node = current_node.next_node
    end

    string_nodes << 'nil'
  end

  def insert_at(value, index)
    return nil if index.negative?

    added_node = Node.new(value)

    if index.zero?
      added_node.next_node = @head
      @head = added_node
    else
      return nil if @head.nil?

      current_node = @head

      (index - 1).times do
        return nil if current_node.next_node.nil?

        current_node = current_node.next_node
      end

      added_node.next_node = current_node.next_node
      current_node.next_node = added_node
    end
  end

  def remove_at(index)
    return nil if @head.nil? || index.negative?

    if index.zero?
      removed_node = @head
      @head = @head.next_node
      return removed_node
    end

    current_node = @head
    (index - 1).times do
      return nil if current_node.next_node.nil?

      current_node = current_node.next_node
    end

    removed_node = current_node.next_node
    return nil if removed_node.nil?

    current_node.next_node = removed_node.next_node
    removed_node
  end
end
