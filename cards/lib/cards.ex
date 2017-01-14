defmodule Cards do
  # create_deck() :: list
  def create_deck do
    values = ["One", "Two", "Three", "Four", "Five", "Six", "Seven",
              "Eight", "Nine", "Ten", "Jack", "Queen", "King", "Ace"]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  # shuffle(list) :: list
  def shuffle(deck) do
    Enum.shuffle(deck) 
  end

  # contains?(list, string) :: boolean
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # deal(list, integer) :: {list, list}
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
end
