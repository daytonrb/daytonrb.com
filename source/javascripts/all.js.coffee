#= require foundation/jquery
#= require_tree .

# Make all 'external' links in a new window
externalLinks = ->
  return  unless document.getElementsByTagName
  anchors = document.getElementsByTagName("a")
  i = 0

  while i < anchors.length
    anchor = anchors[i]
    anchor.target = "_blank"  if anchor.getAttribute("href") and anchor.getAttribute("rel") is "external"
    i++

(($, window, undefined_) ->
  "use strict"
  $doc = $(document)
  Modernizr = window.Modernizr
  $(document).ready ->

    (if $.fn.foundationAlerts then $doc.foundationAlerts() else null)
    (if $.fn.foundationButtons then $doc.foundationButtons() else null)
    (if $.fn.foundationAccordion then $doc.foundationAccordion() else null)
    (if $.fn.foundationNavigation then $doc.foundationNavigation() else null)
    (if $.fn.foundationTopBar then $doc.foundationTopBar() else null)
    (if $.fn.foundationCustomForms then $doc.foundationCustomForms() else null)
    (if $.fn.foundationMediaQueryViewer then $doc.foundationMediaQueryViewer() else null)
    (if $.fn.foundationTabs then $doc.foundationTabs(callback: $.foundation.customForms.appendCustomMarkup) else null)
    (if $.fn.foundationTooltips then $doc.foundationTooltips() else null)
    (if $.fn.foundationMagellan then $doc.foundationMagellan() else null)
    (if $.fn.foundationClearing then $doc.foundationClearing() else null)
    (if $.fn.placeholder then $("input, textarea").placeholder() else null)


  # Hide address bar on mobile devices (except if #hash present, so we don't mess up deep linking).
  if Modernizr.touch and not window.location.hash
    $(window).load ->
      setTimeout (->
        window.scrollTo 0, 1
      ), 0

  externalLinks()

) jQuery, this

