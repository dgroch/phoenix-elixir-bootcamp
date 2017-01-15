defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """


  @doc """
    Creates a deck of cards
  """
  def create_deck do
    values = ["Ace",    "Two",    "Three",  "Four", "Five", "Six",
              "Seven",  "Eight",  "Nine",   "Ten",  "Jack", "Queen",
              "King"]

    suits = ["Spades",  "Clubs",  "Hearts", "Diamonds"]

    for suit <- suits, value <- values, do: "#{value} of #{suit}"
  end

  @doc """
    Returns a shuffled deck of cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck) 
  end

  @doc """
    Checks whether a deck of cards contains a given card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck. The `hand_size` argument indicates how many cards should be in the hand
    
  ## Examples
      
      iex> deck = Cards.create_deck
      iex> hand  = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    {hand, _rest} = Enum.split(deck, hand_size)
    hand
  end

  @doc """
    Save a deck of cards to the filesystem
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a deck of cards from the filesystem
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  # create_hand(hand_size) :: integer -> [ string, ...]
  @doc """
    Creates a hand of cards. The `hand_size` arguments specifies how many cards sohuld be in the hand.
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
