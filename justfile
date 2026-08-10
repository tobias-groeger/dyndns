PYFILES := `echo *.py` + " dyndns"

check:
  ruff check {{PYFILES}}
  ty check {{PYFILES}}
  vermin -v --exclude tomllib -i --no-tips {{PYFILES}}
  md-link-checker

doc:
  update-readme-usage

format:
  ruff check --select I --fix {{PYFILES}} && ruff format {{PYFILES}}

clean:
  @rm -vrf uv.lock *.egg-info build/ dist/ __pycache__/
