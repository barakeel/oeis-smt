;; sequence(s): A189932
;; terms: 4 10 16 22 28 34 40 46 52 56 62 68 74 80 86 92 98 104 108 114
;; small program: (loop(2 + (y - (((x div 2) div (1 + 2)) div (1 + 2))), x + x, 2) + x) * 2
;; fast program: (loop(x - (x div (1 + (2 + (2 * (2 * (2 + 2)))))), 1, 2 + (x + x)) + x) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ 2 (- y (divf (divf (divf x 2) (+ 1 2)) (+ 1 2)))))))
(assert (forall ((x Int)) (= (g0 x) (+ x x))))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (* (+ (v0 x) x) 2))))
(assert (forall ((x Int)) (= (f1 x) (- x (divf x (+ 1 (+ 2 (* 2 (* 2 (+ 2 2))))))))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (+ 2 (+ x x)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ (v1 x) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
