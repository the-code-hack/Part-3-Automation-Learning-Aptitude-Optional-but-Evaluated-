▶️ How to Run

1.Install dependencies:
pip install robotframework selenium robotframework-seleniumlibrary

2. Run the test:
robot tests/login_test.robot

3. After execution, you’ll get:
log.html — detailed step-by-step execution
report.html — summary of pass/fail
output.xml — result file (for CI tools)

✅ Features of this version:
All logic in one file (no external Python files needed).
Includes both valid and invalid login test cases.
Automatically opens browser, executes, and closes after suite.
