;; sequence(s): A57147
;; terms: 0 1 4 9 16 25 36 49 64 81 10 22 36 52 70 90 112 136 162 190
;; small program: (((x div 2) div (1 + (2 + 2))) + (x mod (2 + (2 * (2 + 2))))) * x
;; fast program: (x - ((1 + (2 * (2 + 2))) * (x div (2 + (2 * (2 + 2)))))) * x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (+ (divf (divf x 2) (+ 1 (+ 2 2))) (modf x (+ 2 (* 2 (+ 2 2))))) x))))
(assert (forall ((x Int)) (= (fast x) (* (- x (* (+ 1 (* 2 (+ 2 2))) (divf x (+ 2 (* 2 (+ 2 2)))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
