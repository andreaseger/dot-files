#!/usr/bin/env fish

function gemini-commit
  set MODEL gemini-2.5-flash
  # ==============================
  # Check for staged changes
  # ==============================
  set staged (git diff --cached | string collect)
  if test -z "$staged"
      echo "No staged changes found. Please stage your changes first."
      return 1
  end

  # ==============================
  # Build the prompt
  # ==============================
  set prompt (string collect "
Generate a raw text clear, concise, and conventional git commit message.
Analyze the following staged changes and produce a single commit message in the conventional commits style.

Formatting rules:
- Output ONLY the commit message text.
- Do NOT wrap the message in quotes, backticks, or code fences.
- Do NOT include any explanations or commentary.
- The message should have:
  - A type (feat, fix, docs, style, refactor, test, chore)
  - A short summary (max 72 characters) on the first line
  - An optional body explaining the change in more detail
  - Wrap body lines at ~72 characters

Staged changes:
$staged
"
  )

  # ==============================
  # Generate commit message
  # ==============================
  echo "Generating commit message using model '$MODEL'"
  echo "---"
  set commit_msg (echo $prompt | gemini -m $MODEL -p | string collect)

  echo $commit_msg
  return
  # ==============================
  # Save to temporary file
  # ==============================
  set tmpfile (mktemp)
  echo $commit_msg > $tmpfile
  
  
  # ==============================
  # Open git commit editor with prefilled message
  # ==============================
  git commit -v --template=$tmpfile
  set status_code $status
  
  # ==============================
  # Cleanup temp file
  # ==============================
  rm -f $tmpfile
  
  # ==============================
  # Handle commit result
  # ==============================
  if test $status_code -ne 0
      echo ""
      echo "⚠️ Commit was aborted or failed."
      echo "Reason could be:"
      echo " - You closed the editor without saving"
      echo " - A pre-commit hook failed"
      echo " - Another git error occurred"
      echo "Re-run the script to regenerate a commit message."
      return $status_code
  else
      echo "✅ Commit completed successfully."
  end
end
