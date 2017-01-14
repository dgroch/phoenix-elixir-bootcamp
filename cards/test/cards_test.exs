defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  @deck Cards.create_deck

  test "it creates a deck of cards" do
    assert Enum.count(@deck) == 52
    assert Cards.contains?(@deck, "Ace of Spades")
    refute Cards.contains?(@deck, "Hello, World!")
  end

  test "it shuffles a deck of cards" do
    shuffled_deck = Cards.shuffle(@deck)
    assert Enum.count(shuffled_deck) == 52
    assert @deck !== shuffled_deck
  end

  test "it checks whether a list contains a card" do
    assert Cards.contains?(@deck, "Ace of Spades")
    refute Cards.contains?(@deck, "Hello, World!")
  end

  test "deals a deck of cards" do
    hand_five = Cards.deal(@deck, 5)
    hand_ten = Cards.deal(@deck, 10)
    assert Enum.count(hand_five) == 5
    assert Enum.count(hand_ten) == 10
  end
end
