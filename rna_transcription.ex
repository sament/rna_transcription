defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  Introduction
  Given a DNA strand, return its RNA complement (per RNA transcription).
  Both DNA and RNA strands are a sequence of nucleotides.
  The four nucleotides found in DNA are adenine (A), cytosine (C), guanine (G) and thymine (T).
  The four nucleotides found in RNA are adenine (A), cytosine (C), guanine (G) and uracil (U).
  Given a DNA strand, its transcribed RNA strand is formed by replacing each nucleotide with its complement:

    G -> C
    C -> G
    T -> A
    A -> U
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna_strand) do
    dna_strand
    |>Enum.reduce([], &(&2 ++ Map.get(dna_nucleotides_mapping(), [&1])))
  end

  # @spec to_rna([char]) :: [char]
  # def to_rna(dna_strand) do
  #   nucleotides = dna_nucleotides_mapping()
  #   dna_strand
  #   |>Enum.reduce([], fn(nucleotide, acc) ->
  #       acc ++ Map.get(nucleotides, [nucleotide])
  #     end)
  # end

  defp dna_nucleotides_mapping do
    %{
      'G' => 'C', #cytosine
      'C' => 'G', #guanine
      'T' => 'A', #adenine
      'A' => 'U'  #uracil
     }
  end

  @spec to_rna_v2([list]) :: [list]
  def to_rna_v2(dna) when is_list(dna) do
    dna |> Enum.map(&switch(&1))
    # |> Enum.map(fn nucleotide -> switch(nucleotide)  end)
  end

  def switch(c) do
    case c do
      'G' -> 'C'
      'C' -> 'G'
      'T' -> 'A'
      'A' -> 'U'
    end
  end
end
