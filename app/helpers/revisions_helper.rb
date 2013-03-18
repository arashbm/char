module RevisionsHelper
  def show_diff(a,b)
    diff = Differ.diff_by_word h(b), h(a)
    diff.format_as(:html).html_safe
  end
end
