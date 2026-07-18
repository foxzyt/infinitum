// Infinitum - NumPy-like library for Sapphire
// Version: 1.2.0
// Author: Bernardo Alvim

// Save reference to native rand function before shadowing it
var native_rand = rand;

// Vector operations
function zeros(n) {
    var result = [];
    var i = 0;
    while (i < n) {
        result[len(result)] = 0.0;
        i = i + 1;
    }
    return result;
}

function ones(n) {
    var result = [];
    var i = 0;
    while (i < n) {
        result[len(result)] = 1.0;
        i = i + 1;
    }
    return result;
}

function arange(start, stop, step) {
    var result = [];
    var current = start;
    while (current < stop) {
        result[len(result)] = current;
        current = current + step;
    }
    return result;
}

function linspace(start, stop, num) {
    var result = [];
    var step = (stop - start) / (num - 1);
    var i = 0;
    while (i < num) {
        result[i] = start + (i * step);
        i = i + 1;
    }
    return result;
}

// Vector math operations
function add(v1, v2) {
    var result = [];
    var i = 0;
    var n = len(v1);
    while (i < n) {
        result[i] = v1[i] + v2[i];
        i = i + 1;
    }
    return result;
}

function sub(v1, v2) {
    var result = [];
    var i = 0;
    var n = len(v1);
    while (i < n) {
        result[i] = v1[i] - v2[i];
        i = i + 1;
    }
    return result;
}

function mul(v1, v2) {
    var result = [];
    var i = 0;
    var n = len(v1);
    while (i < n) {
        result[i] = v1[i] * v2[i];
        i = i + 1;
    }
    return result;
}

function div(v1, v2) {
    var result = [];
    var i = 0;
    var n = len(v1);
    while (i < n) {
        result[i] = v1[i] / v2[i];
        i = i + 1;
    }
    return result;
}

function scale(v, scalar) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        result[i] = v[i] * scalar;
        i = i + 1;
    }
    return result;
}

// Reduction operations
function sum(v) {
    var result = 0.0;
    var i = 0;
    var n = len(v);
    while (i < n) {
        result = result + v[i];
        i = i + 1;
    }
    return result;
}

function mean(v) {
    return sum(v) / len(v);
}

function max(v) {
    var result = v[0];
    var i = 1;
    var n = len(v);
    while (i < n) {
        if (v[i] > result) {
            result = v[i];
        }
        i = i + 1;
    }
    return result;
}

function min(v) {
    var result = v[0];
    var i = 1;
    var n = len(v);
    while (i < n) {
        if (v[i] < result) {
            result = v[i];
        }
        i = i + 1;
    }
    return result;
}

// Matrix operations (2D arrays)
function zeros_matrix(rows, cols) {
    var result = [];
    var i = 0;
    while (i < rows) {
        result[i] = zeros(cols);
        i = i + 1;
    }
    return result;
}

function ones_matrix(rows, cols) {
    var result = [];
    var i = 0;
    while (i < rows) {
        result[i] = ones(cols);
        i = i + 1;
    }
    return result;
}

function identity(n) {
    var result = zeros_matrix(n, n);
    var i = 0;
    while (i < n) {
        result[i][i] = 1.0;
        i = i + 1;
    }
    return result;
}

function dot(v1, v2) {
    var result = 0.0;
    var i = 0;
    var n = len(v1);
    while (i < n) {
        result = result + (v1[i] * v2[i]);
        i = i + 1;
    }
    return result;
}

// Statistical functions
function std(v) {
    var m = mean(v);
    var variance_val = 0.0;
    var i = 0;
    var n = len(v);
    while (i < n) {
        variance_val = variance_val + ((v[i] - m) * (v[i] - m));
        i = i + 1;
    }
    return sqrt(variance_val / n);
}

function variance(v) {
    var m = mean(v);
    var variance_val = 0.0;
    var i = 0;
    var n = len(v);
    while (i < n) {
        variance_val = variance_val + ((v[i] - m) * (v[i] - m));
        i = i + 1;
    }
    return variance_val / n;
}

// Utility functions
function abs(v) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        if (v[i] < 0) {
            result[i] = -v[i];
        } else {
            result[i] = v[i];
        }
        i = i + 1;
    }
    return result;
}

function pow(v, exponent) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        result[i] = v[i] ^ exponent;
        i = i + 1;
    }
    return result;
}

function sqrt_list(v) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        result[i] = sqrt(v[i]);
        i = i + 1;
    }
    return result;
}

// Sorting
function sort(v) {
    var result = v;
    var n = len(result);
    var i = 0;
    while (i < n) {
        var j = i + 1;
        while (j < n) {
            if (result[i] > result[j]) {
                var temp = result[i];
                result[i] = result[j];
                result[j] = temp;
            }
            j = j + 1;
        }
        i = i + 1;
    }
    return result;
}

function reverse(v) {
    var result = [];
    var i = len(v) - 1;
    while (i >= 0) {
        result[len(v) - 1 - i] = v[i];
        i = i - 1;
    }
    return result;
}

// Print vector for debugging
function print_vector(v) {
    print("[");
    var i = 0;
    var n = len(v);
    while (i < n) {
        print(v[i]);
        if (i < n - 1) {
            print(", ");
        }
        i = i + 1;
    }
    print("]");
}

// Shape manipulation
function reshape(v, new_rows, new_cols) {
    var result = zeros_matrix(new_rows, new_cols);
    var idx = 0;
    var i = 0;
    while (i < new_rows) {
        var j = 0;
        while (j < new_cols) {
            result[i][j] = v[idx];
            idx = idx + 1;
            j = j + 1;
        }
        i = i + 1;
    }
    return result;
}

function transpose(matrix) {
    var rows = len(matrix);
    var cols = len(matrix[0]);
    var result = zeros_matrix(cols, rows);
    var i = 0;
    while (i < rows) {
        var j = 0;
        while (j < cols) {
            result[j][i] = matrix[i][j];
            j = j + 1;
        }
        i = i + 1;
    }
    return result;
}

function flatten(matrix) {
    var result = [];
    var i = 0;
    var rows = len(matrix);
    while (i < rows) {
        var j = 0;
        var cols = len(matrix[i]);
        while (j < cols) {
            result[len(result)] = matrix[i][j];
            j = j + 1;
        }
        i = i + 1;
    }
    return result;
}

// Slicing
function slice(v, start, end) {
    var result = [];
    var i = start;
    while (i < end) {
        result[len(result)] = v[i];
        i = i + 1;
    }
    return result;
}

// Boolean indexing
function filter(v, threshold) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        if (v[i] > threshold) {
            result[len(result)] = v[i];
        }
        i = i + 1;
    }
    return result;
}

// Advanced linear algebra
function matmul(m1, m2) {
    var rows1 = len(m1);
    var cols1 = len(m1[0]);
    var cols2 = len(m2[0]);
    var result = zeros_matrix(rows1, cols2);
    var i = 0;
    while (i < rows1) {
        var j = 0;
        while (j < cols2) {
            var sum_val = 0.0;
            var k = 0;
            while (k < cols1) {
                sum_val = sum_val + (m1[i][k] * m2[k][j]);
                k = k + 1;
            }
            result[i][j] = sum_val;
            j = j + 1;
        }
        i = i + 1;
    }
    return result;
}

function determinant(matrix) {
    var n = len(matrix);
    if (n == 1) {
        return matrix[0][0];
    }
    if (n == 2) {
        return (matrix[0][0] * matrix[1][1]) - (matrix[0][1] * matrix[1][0]);
    }
    var det = 0.0;
    var j = 0;
    while (j < n) {
        var sign = (-1) ^ j;
        var minor = zeros_matrix(n - 1, n - 1);
        var row = 0;
        var col = 0;
        var i = 1;
        while (i < n) {
            var k = 0;
            while (k < n) {
                if (k != j) {
                    minor[row][col] = matrix[i][k];
                    col = col + 1;
                }
                k = k + 1;
            }
            row = row + 1;
            col = 0;
            i = i + 1;
        }
        det = det + (sign * matrix[0][j] * determinant(minor));
        j = j + 1;
    }
    return det;
}

function inverse(matrix) {
    var n = len(matrix);
    var det = determinant(matrix);
    if (det == 0) {
        return nil;
    }
    var result = zeros_matrix(n, n);
    var i = 0;
    while (i < n) {
        var j = 0;
        while (j < n) {
            var minor = zeros_matrix(n - 1, n - 1);
            var row = 0;
            var col = 0;
            var mi = 0;
            while (mi < n) {
                var mj = 0;
                while (mj < n) {
                    if (mi != i && mj != j) {
                        minor[row][col] = matrix[mi][mj];
                        col = col + 1;
                        if (col == n - 1) {
                            col = 0;
                            row = row + 1;
                        }
                    }
                    mj = mj + 1;
                }
                mi = mi + 1;
            }
            var sign = (-1) ^ (i + j);
            result[j][i] = (sign * determinant(minor)) / det;
            j = j + 1;
        }
        i = i + 1;
    }
    return result;
}

// Broadcasting - scalar operations
function add_scalar(v, scalar) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        result[len(result)] = v[i] + scalar;
        i = i + 1;
    }
    return result;
}

function sub_scalar(v, scalar) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        result[len(result)] = v[i] - scalar;
        i = i + 1;
    }
    return result;
}

function mul_scalar(v, scalar) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        result[len(result)] = v[i] * scalar;
        i = i + 1;
    }
    return result;
}

function div_scalar(v, scalar) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        result[len(result)] = v[i] / scalar;
        i = i + 1;
    }
    return result;
}

// Random number generation
function rand(n) {
    var result = [];
    var i = 0;
    while (i < n) {
        result[len(result)] = native_rand();
        i = i + 1;
    }
    return result;
}

function randn(n) {
    var result = [];
    var i = 0;
    while (i < n) {
        // Box-Muller transform for normal distribution
        var u1 = native_rand();
        var u2 = native_rand();
        var z0 = sqrt(-2 * ln(u1)) * cos(2 * 3.14159265359 * u2);
        result[len(result)] = z0;
        i = i + 1;
    }
    return result;
}

function randint(min_val, max_val, n) {
    var result = [];
    var i = 0;
    while (i < n) {
        result[len(result)] = floor(native_rand() * (max_val - min_val + 1)) + min_val;
        i = i + 1;
    }
    return result;
}

function choice(v, n) {
    var result = [];
    var i = 0;
    while (i < n) {
        var idx = floor(native_rand() * len(v));
        result[len(result)] = v[idx];
        i = i + 1;
    }
    return result;
}

function cumsum(v) {
    var result = [];
    var current_sum = 0.0;
    var i = 0;
    var n = len(v);
    while (i < n) {
        current_sum = current_sum + v[i];
        result[i] = current_sum;
        i = i + 1;
    }
    return result;
}

function prod(v) {
    var result = 1.0;
    var i = 0;
    var n = len(v);
    while (i < n) {
        result = result * v[i];
        i = i + 1;
    }
    return result;
}

function clip(v, min_val, max_val) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        var val = v[i];
        if (val < min_val) {
            result[i] = min_val;
        } else {
            if (val > max_val) {
                result[i] = max_val;
            } else {
                result[i] = val;
            }
        }
        i = i + 1;
    }
    return result;
}

function median(v) {
    var n = len(v);
    if (n == 0) {
        return 0.0;
    }
    
    var sorted_v = sort(v);
    var mid = floor(n / 2);

    if ((mid * 2) == n) {
        return (sorted_v[mid - 1] + sorted_v[mid]) / 2.0;
    } else {
        return sorted_v[mid];
    }
}

// ==========================================
// NEW COMPLEX FUNCTIONS ADDED BELOW
// ==========================================

// 1. 1D Convolution (Signal Processing / Filtering)
function convolve1d(v, kernel) {
    var result = [];
    var n = len(v);
    var m = len(kernel);
    var i = 0;
    while (i < n + m - 1) {
        var sum_val = 0.0;
        var j = 0;
        while (j < m) {
            var v_idx = i - j;
            if (v_idx >= 0) {
                if (v_idx < n) {
                    sum_val = sum_val + (v[v_idx] * kernel[j]);
                }
            }
            j = j + 1;
        }
        result[i] = sum_val;
        i = i + 1;
    }
    return result;
}

// 2. Pearson Correlation Coefficient (Advanced Statistics)
// Returns a value between -1.0 and 1.0 representing linear correlation
function pearson_correlation(v1, v2) {
    var n = len(v1);
    var mean1 = mean(v1);
    var mean2 = mean(v2);
    var num = 0.0;
    var den1 = 0.0;
    var den2 = 0.0;
    var i = 0;
    while (i < n) {
        var diff1 = v1[i] - mean1;
        var diff2 = v2[i] - mean2;
        num = num + (diff1 * diff2);
        den1 = den1 + (diff1 * diff1);
        den2 = den2 + (diff2 * diff2);
        i = i + 1;
    }
    if (den1 == 0.0 || den2 == 0.0) { 
        return 0.0; 
    }
    return num / sqrt(den1 * den2);
}

// 3. LU Decomposition (Advanced Linear Algebra)
// Decomposes a square matrix into Lower (L) and Upper (U) triangular matrices
// Returns an array containing [L, U]
function lu_decomposition(matrix) {
    var n = len(matrix);
    var L = identity(n);
    var U = zeros_matrix(n, n);
    var i = 0;
    
    // Initialize U as copy of matrix
    while (i < n) {
        var j = 0;
        while (j < n) {
            U[i][j] = matrix[i][j];
            j = j + 1;
        }
        i = i + 1;
    }

    var k = 0;
    while (k < n) {
        var i2 = k + 1;
        while (i2 < n) {
            var factor = U[i2][k] / U[k][k];
            L[i2][k] = factor;
            var j2 = k;
            while (j2 < n) {
                U[i2][j2] = U[i2][j2] - (factor * U[k][j2]);
                j2 = j2 + 1;
            }
            i2 = i2 + 1;
        }
        k = k + 1;
    }
    
    var result = [];
    result[0] = L;
    result[1] = U;
    return result;
}

// Vector Norm (Euclidean / L2 Norm)
// Helper for Power Iteration and Machine Learning
function norm(v) {
    var sum_sq = 0.0;
    var i = 0;
    var n = len(v);
    while (i < n) {
        sum_sq = sum_sq + (v[i] * v[i]);
        i = i + 1;
    }
    return sqrt(sum_sq);
}

// 4. Power Iteration (Eigenvalues / Eigenvectors)
// Finds the dominant eigenvalue and its corresponding eigenvector
// Returns an array [dominant_eigenvalue, eigenvector]
function power_iteration(matrix, iterations) {
    var n = len(matrix);
    var v = ones(n);
    var i = 0;
    
    while (i < iterations) {
        var v_new = [];
        var r = 0;
        while (r < n) {
            var sum_val = 0.0;
            var c = 0;
            while (c < n) {
                sum_val = sum_val + (matrix[r][c] * v[c]);
                c = c + 1;
            }
            v_new[r] = sum_val;
            r = r + 1;
        }
        
        var v_norm = norm(v_new);
        var j = 0;
        while (j < n) {
            v[j] = v_new[j] / v_norm;
            j = j + 1;
        }
        i = i + 1;
    }
    
    // Rayleigh quotient to find the eigenvalue
    var eigen_val = 0.0;
    var r2 = 0;
    while (r2 < n) {
        var sum2 = 0.0;
        var c2 = 0;
        while (c2 < n) {
            sum2 = sum2 + (matrix[r2][c2] * v[c2]);
            c2 = c2 + 1;
        }
        eigen_val = eigen_val + (v[r2] * sum2);
        r2 = r2 + 1;
    }
    
    var result = [];
    result[0] = eigen_val; 
    result[1] = v;         
    return result;
}

// 5. Softmax Function (Machine Learning / Neural Networks)
// Converts a vector of numbers into a vector of probabilities
function softmax(v) {
    var max_val = max(v); // Subtracted for numerical stability
    var result = [];
    var sum_exp = 0.0;
    var i = 0;
    var n = len(v);
    
    while (i < n) {
        // Assuming exp() is natively available like sqrt() and ln()
        var e_val = exp(v[i] - max_val);
        result[i] = e_val;
        sum_exp = sum_exp + e_val;
        i = i + 1;
    }
    
    var j = 0;
    while (j < n) {
        result[j] = result[j] / sum_exp;
        j = j + 1;
    }
    
    return result;
}

// 6. Sigmoid Function (Machine Learning Activation)
function sigmoid(v) {
    var result = [];
    var i = 0;
    var n = len(v);
    while (i < n) {
        result[i] = 1.0 / (1.0 + exp(-v[i]));
        i = i + 1;
    }
    return result;
}