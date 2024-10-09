;; sequence(s): A214394
;; terms: 0 1 2 3 4 5 1 7 8 9 10 11 2 13 14 15 16 17 3 19
;; small program: x div (if (x mod (2 + (2 + 2))) <= 0 then (2 + (2 + 2)) else 1)
;; fast program: loop(x div (2 + (2 + 2)), 1 - (x mod (2 + (2 + 2))), x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf x (ite (<= (modf x (+ 2 (+ 2 2))) 0) (+ 2 (+ 2 2)) 1)))))
(assert (forall ((x Int)) (= (f0 x) (divf x (+ 2 (+ 2 2))))))
(assert (forall ((x Int)) (= (g0 x) (- 1 (modf x (+ 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (v0 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
