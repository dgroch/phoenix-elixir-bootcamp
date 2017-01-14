defmodule Cards do
  # create_deck() :: list
  def create_deck do
    values = ["Ace",    "Two",    "Three",  "Four", "Five", "Six",
              "Seven",  "Eight",  "Nine",   "Ten",  "Jack", "Queen",
              "King"]

    suits = ["Spades",  "Clubs",  "Hearts", "Diamonds"]

    for suit <- suits, value <- values, do: "#{value} of #{suit}"
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
    { hand, rest_of_deck} = Enum.split(deck, hand_size)
    hand
  end
end
