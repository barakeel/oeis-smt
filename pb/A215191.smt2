;; sequence(s): A215191
;; terms: 0 18 88 276 664 1366 2512 4264 6800 10330 15080 21308 29288 39326 51744 66896 85152 106914 132600 162660
;; small program: (((((1 + x) * ((2 + x) * x)) div (1 + 2)) + loop(x * x, 2, 1 + x)) div 2) * 2
;; fast program: ((((((2 + x) * (2 + (((2 * (2 + x)) + x) * x))) - 1) + x) * (1 + x)) div (2 + (2 + 2))) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (divf (+ (divf (* (+ 1 x) (* (+ 2 x) x)) (+ 1 2)) (v0 x)) 2) 2))))
(assert (forall ((x Int)) (= (fast x) (* (divf (* (+ (- (* (+ 2 x) (+ 2 (* (+ (* 2 (+ 2 x)) x) x))) 1) x) (+ 1 x)) (+ 2 (+ 2 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
