# /test Command

Run test suites, analyze failures, and propose fixes.

## Instructions
1. Detect the project test runner (e.g., `npm test`, `pytest`, `cargo test`, `go test ./...`).
2. Run the test suite and capture the output.
3. If all tests pass:
   - Report test statistics (total tests run, passed, execution time).
4. If tests fail:
   - Identify the exact test file, line number, and error stack trace.
   - Explain the root cause of the failure clearly.
   - Propose or apply the minimal necessary fix in code (or test).
   - Re-run the tests to verify the fix works.
