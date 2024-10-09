;; sequence(s): A37668
;; terms: 3 17 85 428 2142 10710 53553 267767 1338835 6694178 33470892 167354460 836772303 4183861517 20919307585 104596537928 522982689642 2614913448210 13074567241053 65372836205267
;; small program: (loop((((2 * (x + x)) - 2) + ((x div 2) mod 2)) + x, 2 + x, 1) div 2) div 2
;; fast program: (loop((loop((((x + x) + x) div ((2 * loop(x * x, 2, 2)) - 1)) + x, 1, loop((2 * (x + x)) + x, x, 1)) + 1) div 2, 1, 2 + x) div 2) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f3 (Int) Int)
(declare-fun g3 () Int)
(declare-fun h3 () Int)
(declare-fun u3 (Int Int) Int)
(declare-fun v3 () Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun f4 (Int) Int)
(declare-fun g4 (Int) Int)
(declare-fun h4 () Int)
(declare-fun u4 (Int Int) Int)
(declare-fun v4 (Int) Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (- (* 2 (+ x x)) 2) (modf (divf x 2) 2)) x))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (divf (v0 x) 2) 2))))
(assert (forall ((x Int)) (= (f3 x) (* x x))))
(assert (= g3 2))
(assert (= h3 2))
(assert (forall ((x Int) (y Int)) (= (u3 x y) (ite (<= x 0) y (f3 (u3 (- x 1) y))))))
(assert (= v3 (u3 g3 h3)))
(assert (forall ((x Int)) (= (f2 x) (+ (divf (+ (+ x x) x) (- (* 2 v3) 1)) x))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (f4 x) (+ (* 2 (+ x x)) x))))
(assert (forall ((x Int)) (= (g4 x) x)))
(assert (= h4 1))
(assert (forall ((x Int) (y Int)) (= (u4 x y) (ite (<= x 0) y (f4 (u4 (- x 1) y))))))
(assert (forall ((x Int)) (= (v4 x) (u4 (g4 x) h4))))
(assert (forall ((x Int)) (= (h2 x) (v4 x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (f1 x) (divf (+ (v2 x) 1) 2))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (divf (v1 x) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
