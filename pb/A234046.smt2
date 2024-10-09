;; sequence(s): A234046
;; terms: 0 1 ~1 0 0 ~1 1 0 1 ~1 0 0 ~1 1 0 1 ~1 0 0 ~1
;; small program: loop(1 - ((x * x) mod (1 + (2 + (2 + 2)))), 2, x)
;; fast program: (((1 - (2 * (x * x))) mod (1 + (2 + (2 + 2)))) - 1) div (2 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (- 1 (modf (* x x) (+ 1 (+ 2 (+ 2 2))))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (divf (- (modf (- 1 (* 2 (* x x))) (+ 1 (+ 2 (+ 2 2)))) 1) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
